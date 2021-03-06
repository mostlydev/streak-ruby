module Streak
  class Box < StreakObject
    def self.all(pipeline_key=nil, params={})
      path = pipeline_key ? "/pipelines/#{pipeline_key}/boxes" : "/boxes"
      res = Streak.request(:get, path, params)
      convert_to_streak_object(res, Box)
    end

    def self.find(key)
      res = Streak.request(:get, "/boxes/#{key}")
      convert_to_streak_object(res, Box)
    end

    def self.create(pipeline_key, params={})
      res = Streak.request(:put, "/pipelines/#{pipeline_key}/boxes", params)
      convert_to_streak_object(res, Box)
    end

    def self.delete(key)
      res = Streak.request(:delete, "/boxes/#{key}", nil)
      # convert_to_streak_object(res, Box)
    end

    def self.update(key, params)
      res = Streak.request(:post, "/boxes/#{key}", MultiJson.dump(params))
      convert_to_streak_object(res, Box)
    end

    def self.update_fields(key, params)
      res = Streak.request(:post, "/boxes/#{key}/fields", MultiJson.dump(params))
      convert_to_streak_object(res, Box)
    end

    def self.update_linked_boxes(key, linked_box_keys)
      res = Streak.request(:post, "/boxes/#{key}", MultiJson.dump({'linkedBoxKeys' => linked_box_keys}))
      convert_to_streak_object(res, Box)
    end

    def self.update_field(key, field_key, field_val)
      res = Streak.request(:post, "/boxes/#{key}/fields/#{field_key}",MultiJson.dump({value: field_val}))
    end
  end
end
