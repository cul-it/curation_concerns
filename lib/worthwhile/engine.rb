#Load blacklight which will give worthwhile views a higher preference than those in blacklight
require 'blacklight'
require 'sufia/models'  
require 'hydra-collections'

module Worthwhile
  class Engine < ::Rails::Engine
    isolate_namespace Worthwhile
    require 'breadcrumbs_on_rails'

    config.autoload_paths += %W(
     #{config.root}/lib
     #{config.root}/app/actors/concerns
    )
    
    initializer 'worthwhile.initialize' do
      require 'worthwhile/rails/routes' 
    end
  end
end
