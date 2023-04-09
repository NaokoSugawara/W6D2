class AttrAccessorObject
  def self.my_attr_accessor(*names)

      names.each do |name|
        define_method(name) do
          @name = "value of @#{name}"
        end
      end

      names.each do |name|
        define_method("#{name}=") do |value|
          instance_variable_set("@#{name}", value)
        end
      end
      
      # names.each do |name|
      #   define_method("instance_variable_set", name) do |value|
      #     @name = "value of @#{value}"
      #   end
      # end
  end
end
