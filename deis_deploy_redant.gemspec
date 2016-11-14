# encoding: UTF-8

Gem::Specification.new do |s|
  s.name        = 'deis_deploy_redant'
  s.version     = '0.0.2'
  s.date        = '2016-11-14'
  s.summary     = 'Deploy apps to the Red Ant Deis cluster and notify deployments'
  s.description = 'Automates the process of pushing a new release and sending a deploy notification to the billing api'
  s.authors     = ['Thomas Davies']
  s.email       = 'thomas@redant.com.au'
  s.files       = Dir.glob("lib/**/*") + %w(README.md LICENSE)
  s.homepage    = 'https://github.com/red-ant/deis-deploy-ruby'
  s.license     = 'MIT'

  s.add_development_dependency 'bundler', '~> 1.5'
  s.add_development_dependency 'rspec', '~>3.5'
  s.add_development_dependency 'webmock', '~>2.1'
end
