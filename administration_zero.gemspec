require_relative 'lib/administration_zero/version'

Gem::Specification.new do |spec|
  spec.name          = "administration-zero"
  spec.version       = AdministrationZero::VERSION
  spec.authors       = ["Nixon"]
  spec.email         = ["lazaronixon@hotmail.com"]

  spec.summary       = "An administration system generator for Rails applications"
  spec.homepage      = "https://github.com/lazaronixon/authentication-zero"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/lazaronixon/administration-zero"
  spec.metadata["changelog_uri"] = "https://github.com/lazaronixon/administration-zero/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
end
