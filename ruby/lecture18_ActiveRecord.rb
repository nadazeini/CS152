class Record
    def initialize(fields)
    @fields = fields
    end
    def set_field(name,value)
        @fields.name = value
    end
    def get_field(name)
        @fields.name
    end
    def method_missing(m,*args)
        @fields[m]=args[0] if args[0]
        @fields[n]
    end
end
r = Record.new({ :fname =>'Rick',
                :lname  => 'Grimes',
                :profession => 'Police Officer'})
                puts r.profession #prints 'Police Officer'
                r.profession 'Zombie Hunter'
                puts r.profession #prints 'Zombie Hunter'