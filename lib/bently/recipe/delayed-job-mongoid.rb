module Bently
  class DelayedJobMongoid < RailsRecipe

    title 'delayed_job Mongoid'
    category 'gem'
    description 'downloads and installs delayed_job_mongoid gem'
    homepage 'https://github.com/collectiveidea/delayed_job/blob/master/README.md'
    version '3.0'

    def initialize
      gem 'delayed_job_mongoid'
      bundle
    end

  end
end
