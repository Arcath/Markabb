module MarkabbMacros
    module Formatting
        def self.included(base)
            base.extend(ClassMethods)
        end
        
        module ClassMethods
            def it_should_apply_formatting(*formats)
                formats.each do |format|
                    it "should apply the #{format[0]} tag to text" do
                        default_config
                        Markabb.parse("[#{format[1]}]#{format[0]}[/#{format[1]}]").should eq("<#{format[1]}>#{format[0]}</#{format[1]}>")
                    end

                    it "should not apply the bold tag to text if it is disbaled" do
                        default_config
                        Markabb.parse "[#{format[1]}]#{format[0]}[/#{format[1]}]" do |c|
                            c["disable_#{format[0]}".to_sym] = true
                        end.should eq("[#{format[1]}]#{format[0]}[/#{format[1]}]")
                    end
                end
            end
        end
    end
end