require 'time'
require 'date'

class CurrentTime

DAY = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
RANGE = []

 def given_time_fall(time)
   monday_1800_2000(time)
   get_sat_sun(time)
 	 mon_fri_0800_1700(time)
 	 mon_sun_0600_0700(time)
 	 fri_sat_1900_2200(time)
   puts "\nTime                ::    Time Windows"
 	 puts "\n#{time.strftime("%Y-%m-%d %H:%M:%S")} ::  #{RANGE}"
   puts "\n" 
 end


 def monday_1800_2000(dat)
  if  DAY[dat.wday] == ("Monday" and (dat.hour == 18 and dat.hour <= 20))
    RANGE << "Mon 1800-2000" 
  end
 end 
 
 def get_sat_sun(dat)
  	RANGE << "Sat-Sun" if DAY[dat.wday] == ("Saturday" or "Sunday")
 end

def mon_fri_0800_1700(dat)
  if (DAY - ["Saturday","Sunday"]).include?(DAY[dat.wday]) and (dat.hour >= 8 and dat.hour <= 17)
	RANGE << "Mon-Fri 0800-1700"
  end
end

def mon_sun_0600_0700(dat)
 if DAY.include?(DAY[dat.wday]) and (dat.hour >= 6 and dat.hour <= 7)
	RANGE << "Mon-Sun 0600-0700"
  end
end

def fri_sat_1900_2200(dat)
 if DAY[dat.wday] == ("Friday" or "Saturday") and (dat.hour >= 19 and dat.hour <= 22)
  	RANGE << "Fri-Sat 1900-2200"
  end
end

end

 if not ARGV.empty?
  time = DateTime.parse(ARGV[0])
 else
  time = DateTime.parse(Time.now.strftime("%Y-%m-%d %H:%M:%S"))
 end

CurrentTime.new.given_time_fall(time)
