class NoSymbolsValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        record.errors[attribute] << (options[:message] || "must contain no symbols") if value =~ /[<>@£$&*]/i
    end
end