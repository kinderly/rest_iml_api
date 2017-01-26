Gem::Specification.new do |s|
  s.name = 'rest_iml_api'
  s.version = '0.2'
  s.authors = ['Kinderly LTD']
  s.email = 'pustserg@yandex.ru'
  s.homepage = 'https://github.com/kinderly/rest_iml_api'
  s.summary = %q{A wrapper for REST IML Logistics API}
  s.description = %q{This gem provides a Ruby wrapper over REST IML Logistics API.}
  s.license = 'MIT'
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ['lib']
end
