$:.push File.expand_path("../lib", __FILE__)

require "carrierwave-scp/version"

Gem::Specification.new do |s|
  s.name        = "carrierwave-scp"
  s.version     = CarrierwaveScp::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Rodrigo Batista da Silva"]
  s.email       = ["rbsilva.ti@gmail.com"]
  s.homepage    = "https://github.com/rbsilva/carrierwave-scp"
  s.summary     = "SCP storage for CarrierWave."
  s.description = "Add the storage option of SCP to the gem CarrierWave."

  s.rubyforge_project = "carrierwave-scp"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec}/*`.split("\n")

  s.add_dependency "carrierwave"
  s.add_dependency "net-scp"

  s.add_development_dependency "rspec"
end
