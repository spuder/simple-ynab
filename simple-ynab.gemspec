Gem::Specification.new do |s|
  s.name      = 'simple-ynab'
  s.version   = '1.1.0'
  s.date      = '2016-12-26'
  s.summary   = "Converts csv from simple format to ynab format"
  s.description = "Converts simple bank csv to ynab csv"
  s.authors   = ["Spencer Owen"]
  s.email     = 'owenspencer@gmail.com'
  s.files     = ["bin/simple-ynab"]
  s.license   = 'MIT'
  s.homepage  =
    'https://github.com/spuder/simple-ynab'
  s.executables = ['simple-ynab']
  s.add_runtime_dependency 'slop', '~> 3.0'
  s.add_runtime_dependency 'colorize', '~> 0.7.0'
end
