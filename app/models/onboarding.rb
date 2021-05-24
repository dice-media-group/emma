class Onboarding
    attr_accessor(:model_to_test, :site_settings_models, :content_models, :publisher_accts)

    def initialize(model_to_test: Biography, 
        site_settings_models: [
            "Biography",
            "BookInfo",
            "GeneralInfo",
            "HomeInfo",
            "FirstTime",
            "GetInContactContent",
            "HireMe",
            "MeetupInfo",
            "Podcast",
            "PressKit"
        ],
        content_models: [
            "Blog::Entry",
            "Blog::Article",
            "Blog::RecommendedEntry",
            "Meetup",
            "MediaAppearance",
            "MerchandiseLink",
            "Photo"
        ],
        publisher_accts: PublisherAcct.all
      )
      @model_to_test        = model_to_test
      @site_settings_models = site_settings_models
      @publisher_accts      = publisher_accts
      @content_models       = content_models
    end
 
    def single_model_changed?
        model = _get_klass_from_string(model_to_test)
        last = model.last
        last.created_at != last.updated_at
    end

    def site_settings_model?
        site_settings_models.include?(model_to_test.to_s)
    end

    def at_least_one_item_created?
        model = _get_klass_from_string(model_to_test)
        model.count >= 1
    end

    def model_completed?
        if site_settings_model?
            single_model_changed?
        else
            # content entry model
            at_least_one_item_created?
        end
    end

    def completed_steps_percentage
        steps = site_settings_models    #.concat(content_models) #add after initial test works
        completed_steps = []
        steps.each do |step|
            klass = _get_klass_from_string(step)
            self.model_to_test = klass
            completed_steps << self.model_completed? if self.model_completed? == true
        end
        
        fraction = (completed_steps.length / steps.length.to_f)
        percentage  = (fraction * 100).round
    end

    def _get_klass_from_string(string)
        klass = Object.const_get string.to_s
    end
  end