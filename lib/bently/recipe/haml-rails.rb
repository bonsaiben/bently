module Bently

  class HamlRails < Recipe

    GEM_DEF =
%{gem 'haml'
gem 'haml-rails'}

    def bake
      add_gem GEM_DEF
      bundle_install
      super
    end
  end

end
