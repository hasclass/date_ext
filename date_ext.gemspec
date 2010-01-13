# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{date_ext}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["hasclass"]
  s.date = %q{2010-01-13}
  s.description = %q{Ruby classes for weekday, month, etc.}
  s.email = %q{sebastian.burkhard@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "date_ext.gemspec",
     "init.rb",
     "lib/core_ext.rb",
     "lib/date_ext.rb",
     "lib/month.rb",
     "lib/quarter.rb",
     "lib/weekday.rb",
     "lib/year.rb",
     "test/month_test.rb",
     "test/quarter_test.rb",
     "test/test_helper.rb",
     "test/weekday_test.rb",
     "test/year_test.rb"
  ]
  s.homepage = %q{http://github.com/hasclass/test}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{date extensions helps you work with weekdays, workdays, holidays, months, weeks, etc.}
  s.test_files = [
    "test/month_test.rb",
     "test/quarter_test.rb",
     "test/test_helper.rb",
     "test/weekday_test.rb",
     "test/year_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end

