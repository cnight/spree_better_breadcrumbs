module SpreeBetterBreadcrumbs
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../../../app/helpers/spree', __FILE__)

      def copy_spree_breadcrums
        say_status("copying", "base_helper_decorator.rb", :green)
        copy_file "base_helper_decorator.rb", "app/helpers/base_helper_decorator.rb"
      end

    end
  end
end
