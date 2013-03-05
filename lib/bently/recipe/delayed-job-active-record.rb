module Bently
  class DelayedJobActiveRecord < RailsRecipe

    title 'delayed_job Active Record'
    category 'gem'
    description 'downloads and installs delayed_job_active_record gem'
    homepage 'https://github.com/collectiveidea/delayed_job/blob/master/README.md'
    version '3.0'

    def initialize
      gem 'delayed_job_active_record'
      bundle
      generate 'delayed_job:active_record'
      migrate
    end

  end
end
