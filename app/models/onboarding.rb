class Onboarding
    attr_accessor(:model_to_test, :site_settings_models, :content_models, :publisher_accts, :publisher_acct)

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
            "Meetup",
            "MediaAppearance",
            "MerchandiseLink",
            "Photo"
        ],
        publisher_accts: PublisherAcct.all,
        publisher_acct: PublisherAcct.first
      )
      @model_to_test        = model_to_test
      @site_settings_models = site_settings_models
      @publisher_accts      = publisher_accts
      @content_models       = content_models
      @publisher_accts      = publisher_accts
      @publisher_acct       = publisher_acct
    end
 
    def step_completed?

        if _site_settings_model?
            puts "#{model_to_test} is truly a settings model"
            completion_status = _single_model_changed?
        else
            # content entry model
            puts "#{model_to_test} is false since it's a content model"
            completion_status = _at_least_one_item_created?
        end
        # puts "#{model_to_test} is #{completion_status}"
        completion_status
    end

    def settings_step_completed?
        puts "#{model_to_test} is truly a settings model"
        completion_status = _single_model_changed?
    end

    def content_step_completed?
        # content entry model
        puts "#{model_to_test} is a content model"
        completion_status = _at_least_one_item_created?
    end

    def publisher_acct_step_completed?
        # content entry model
        puts "#{publisher_acct.name} is a publisher account created at #{publisher_acct.created_at} and updated at #{publisher_acct.updated_at} "
        puts "completed: #{_publisher_acct_changed?}"
        completion_status = _publisher_acct_changed?
    end

    def completed_steps_percentage
        steps = site_settings_models.concat(content_models) #add after initial test works
        completed_steps = []
        steps.each do |step|
            klass = _get_klass_from_string(step)
            self.model_to_test = klass
            completed_steps << self.step_completed? if self.step_completed? == true
        end
        
        fraction = (completed_steps.length / steps.length.to_f)
        percentage  = (fraction * 100).round
    end

    def completed_settings_steps_percentage
        steps = site_settings_models #add after initial test works
        completed_steps = []
        steps.each do |step|
            klass = _get_klass_from_string(step)
            self.model_to_test = klass
            completed_steps << self.step_completed? if self.step_completed? == true
        end
        
        fraction = (completed_steps.length / steps.length.to_f)
        percentage  = (fraction * 100).round

    end

    def completed_content_steps_percentage
        steps = content_models #add after initial test works
        completed_steps = []
        steps.each do |step|
            klass = _get_klass_from_string(step)
            self.model_to_test = klass
            completed_steps << self.step_completed? if self.step_completed? == true
        end
        
        fraction = (completed_steps.length / steps.length.to_f)
        percentage  = (fraction * 100).round

    end

    def completed_publisher_steps_percentage
        steps = publisher_accts
        completed_steps = []
        steps.each do |step|
            self.publisher_acct = step
            completed_steps << self.publisher_acct_step_completed? if self.publisher_acct_step_completed? == true
        end
        puts "completed_steps: #{completed_steps}"
        fraction = (completed_steps.length / steps.length.to_f)
        percentage  = (fraction * 100).round

    end
    def _get_klass_from_string(string)
        klass = Object.const_get string.to_s
    end

    def _single_model_changed?
        model = _get_klass_from_string(model_to_test)
        last = model.last
        last.created_at != last.updated_at
    end

    def _publisher_acct_changed?
        self.publisher_acct.created_at != self.publisher_acct.updated_at
    end

    def _site_settings_model?
        site_settings_models.include?(model_to_test.to_s)
    end

    def _at_least_one_item_created?
        model = _get_klass_from_string(model_to_test)
        model.count >= 1
    end

  end