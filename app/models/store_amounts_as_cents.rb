module StoreAmountsAsCents

  #TODO: This was nice as an exercise, don't forget to try implementing this the way that Steve suggested
  def method_missing(method_name, *args, &block)
    real_method_name = method_name.to_s.gsub("=", "") + "_cents"
    #If there is a corresponding method dealing with this same field but with _cents appended to the name
    if self.respond_to?(real_method_name)
      if args.empty?  #if this is a getter, convert from cents to $ format
        cents_val = self.send(real_method_name) 
        return cents_val.to_f/100 if cents_val
      else  #If this is a setter, convert from $ format to cents
        self.send("#{real_method_name}=", args[0].to_f * 100)
      end        
    else
      #TODO Awkward
      return super(method_name) unless args.size > 0
      return super(method_name, args) unless block
      return super(method_name,args, block)
    end
  end
  
end
