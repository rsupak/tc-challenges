# -*- encoding: utf-8 -*-
# stub: activeadmin 1.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "activeadmin".freeze
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Greg Bell".freeze]
  s.date = "2018-01-10"
  s.description = "The administration framework for Ruby on Rails.".freeze
  s.email = ["gregdbell@gmail.com".freeze]
  s.homepage = "http://activeadmin.info".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2".freeze)
  s.rubygems_version = "2.5.2.3".freeze
  s.summary = "The administration framework for Ruby on Rails.".freeze

  s.installed_by_version = "2.5.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<arbre>.freeze, [">= 1.1.1"])
      s.add_runtime_dependency(%q<coffee-rails>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<formtastic>.freeze, ["~> 3.1"])
      s.add_runtime_dependency(%q<formtastic_i18n>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<inherited_resources>.freeze, ["~> 1.7"])
      s.add_runtime_dependency(%q<jquery-rails>.freeze, [">= 4.2.0"])
      s.add_runtime_dependency(%q<kaminari>.freeze, ["< 2.0", ">= 0.15"])
      s.add_runtime_dependency(%q<railties>.freeze, ["< 5.2", ">= 4.2"])
      s.add_runtime_dependency(%q<ransack>.freeze, ["~> 1.3"])
      s.add_runtime_dependency(%q<sass>.freeze, ["~> 3.1"])
      s.add_runtime_dependency(%q<sprockets>.freeze, ["< 4.1"])
    else
      s.add_dependency(%q<arbre>.freeze, [">= 1.1.1"])
      s.add_dependency(%q<coffee-rails>.freeze, [">= 0"])
      s.add_dependency(%q<formtastic>.freeze, ["~> 3.1"])
      s.add_dependency(%q<formtastic_i18n>.freeze, [">= 0"])
      s.add_dependency(%q<inherited_resources>.freeze, ["~> 1.7"])
      s.add_dependency(%q<jquery-rails>.freeze, [">= 4.2.0"])
      s.add_dependency(%q<kaminari>.freeze, ["< 2.0", ">= 0.15"])
      s.add_dependency(%q<railties>.freeze, ["< 5.2", ">= 4.2"])
      s.add_dependency(%q<ransack>.freeze, ["~> 1.3"])
      s.add_dependency(%q<sass>.freeze, ["~> 3.1"])
      s.add_dependency(%q<sprockets>.freeze, ["< 4.1"])
    end
  else
    s.add_dependency(%q<arbre>.freeze, [">= 1.1.1"])
    s.add_dependency(%q<coffee-rails>.freeze, [">= 0"])
    s.add_dependency(%q<formtastic>.freeze, ["~> 3.1"])
    s.add_dependency(%q<formtastic_i18n>.freeze, [">= 0"])
    s.add_dependency(%q<inherited_resources>.freeze, ["~> 1.7"])
    s.add_dependency(%q<jquery-rails>.freeze, [">= 4.2.0"])
    s.add_dependency(%q<kaminari>.freeze, ["< 2.0", ">= 0.15"])
    s.add_dependency(%q<railties>.freeze, ["< 5.2", ">= 4.2"])
    s.add_dependency(%q<ransack>.freeze, ["~> 1.3"])
    s.add_dependency(%q<sass>.freeze, ["~> 3.1"])
    s.add_dependency(%q<sprockets>.freeze, ["< 4.1"])
  end
end
