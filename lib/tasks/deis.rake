# encoding: UTF-8

require 'httparty'
require 'json'

namespace :deis do

  desc 'Deploy an app to deis and report the deploy to deis-billing'
  task :deploy, [:git_remote] => [:environment] do |t, args|
    git_remote = args.git_remote || 'deis'

    check_billing_app_url!

    current_git_branch = `git symbolic-ref --short HEAD`.delete("\n")

    if system("git push #{git_remote} #{current_git_branch}:master")
      report_deis_deploy(git_remote)
    else
      puts "\n\n *** Deploy failed ***\n\n"
    end
  end

  desc 'Report a deploy to deis-billing'
  task :report, [:git_remote] => [:environment] do |t, args|
    check_billing_app_url!
    report_deis_deploy(args.git_remote)
  end
end

def report_deis_deploy(git_remote)
  remote_path = `git remote get-url #{git_remote}`
  app_name = /2222\/(?<deis_app>.+?)\.git/.match(remote_path)[:deis_app]
  deploy_user = /You are (?<username>.+?) /.match(`deis whoami`)
  previous_git_sha = HTTParty.get("#{DeisDeployRedant.configuration.billing_app_url}#{app_name}").parsed_response
  current_git_sha = `git rev-parse HEAD`

  deploy_message = ''
  if previous_git_sha.nil? || previous_git_sha.empty?
    deploy_message = 'Initial commit, see github for full change list'
  elsif DeisDeployRedant.configuration.deploy_message_merges
    # Get merges between releases
    deploy_message = `git log --merges --format="* %b" #{previous_git_sha}..HEAD`
  else
    # Get commits between releases
    deploy_message = `git log --format="* %s" #{previous_git_sha}..HEAD`
  end

  HTTParty.post(
    "#{DeisDeployRedant.configuration.billing_app_url}#{app_name}/report-deploy",
    :body => JSON.dump({
      :git_sha        => current_git_sha,
      :user           => deploy_user,
      :deploy_message => deploy_message
    })
  )
end

def check_billing_app_url!
  raise StandardError, 'Must set billing_app_url in DeisDeployRedant initializer' if DeisDeployRedant.configuration.billing_app_url.empty?
end
