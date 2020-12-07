module UsersHelper
    def age(birth_date)
        ((Time.zone.now - birth_date.to_time) / 1.year.seconds).floor
    end
end
