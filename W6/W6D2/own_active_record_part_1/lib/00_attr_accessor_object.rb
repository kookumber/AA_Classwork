class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
    names.each do |name|
      define_method(name) do 
        self.instance_variable_get("@#{name}".to_sym)
      end
    end

    names.each do |name|
      define_method("#{name}=") do |set_to|
        self.instance_variable_set("@{name}", set_to)
      end
    end

  end
end
