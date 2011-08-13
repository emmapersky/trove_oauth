Gem::Specification.new do |s|
  s.name = %q{trove_oauth}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Emma Persky"]
  s.date = %q{2011-08-12}
  s.description = %q{trove_oauth is a ruby client for the Trove API using OAuth.}
  s.email = %q{emma.persky@gmail.com}
  s.files = ["LICENSE", "README","lib/trove_oauth.rb"] + Dir.glob('lib/trove_oauth/*.rb')
  s.has_rdoc = false
  s.homepage = %q{http://github.com/emmapersky/trove_oauth}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{trove_oauth}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{trove_oauth is a ruby client for the Trove API using OAuth.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oauth>, [">= 0.4.5"])
      #s.add_runtime_dependency(%q<json>, [">= 1.1.9"])
      #s.add_runtime_dependency(%q<mime-types>, [">= 1.16"])
      #%w(shoulda mocha).each do |dep|
      #  s.add_development_dependency dep
      end
    else
      s.add_dependency(%q<oauth>, [">= 0.4.5"])
      #s.add_dependency(%q<json>, [">= 1.1.9"])
      #s.add_dependency(%q<mime-types>, [">= 1.16"])
    end
  else
    s.add_dependency(%q<oauth>, [">= 0.4.1"])
    #s.add_dependency(%q<json>, [">= 1.1.9"])
    #s.add_dependency(%q<mime-types>, [">= 1.16"])
  end
end