desc "Grab data from US Sensus API"
task :populate_from_sensus => :environment do
  
  state_fips_codes = {
    '02' => { abr: "AK", full_name: "ALASKA" }, 
    '01' => { abr: "AL", full_name: "ALABAMA" },
    '05' => { abr: "AR", full_name: "ARKANSAS" },
    '60' => { abr: "AS", full_name: "AMERICAN SAMOA" },
    '04' => { abr: "AZ", full_name: "ARIZONA" },
    '06' => { abr: "CA", full_name: "CALIFORNIA" },
    '08' => { abr: "CO", full_name: "COLORADO" },
    '09' => { abr: "CT", full_name: "CONNECTICUT" },
    '11' => { abr: "DC", full_name: "DISTRICT OF COLUMBIA" },
    '10' => { abr: "DE", full_name: "DELAWARE" },
    '12' => { abr: "FL", full_name: "FLORIDA" },
    '13' => { abr: "GA", full_name: "GEORGIA" },
    '66' => { abr: "GU", full_name: "GUAM" },
    '15' => { abr: "HI", full_name: "HAWAII" },
    '19' => { abr: "IA", full_name: "IOWA" },
    '16' => { abr: "ID", full_name: "IDAHO" },
    '17' => { abr: "IL", full_name: "ILLINOIS" },
    '18' => { abr: "IN", full_name: "INDIANA" },
    '20' => { abr: "KS", full_name: "KANSAS" },
    '21' => { abr: "KY", full_name: "KENTUCKY" },
    '22' => { abr: "LA", full_name: "LOUISIANA" },
    '25' => { abr: "MA", full_name: "MASSACHUSETTS" },
    '24' => { abr: "MD", full_name: "MARYLAND" },
    '23' => { abr: "ME", full_name: "MAINE" },
    '26' => { abr: "MI", full_name: "MICHIGAN" },
    '27' => { abr: "MN", full_name: "MINNESOTA" },
    '29' => { abr: "MO", full_name: "MISSOURI" },
    '28' => { abr: "MS", full_name: "MISSISSIPPI" },
    '30' => { abr: "MT", full_name: "MONTANA" },
    '37' => { abr: "NC", full_name: "NORTH CAROLINA" },
    '38' => { abr: "ND", full_name: "NORTH DAKOTA" },
    '31' => { abr: "NE", full_name: "NEBRASKA" },
    '33' => { abr: "NH", full_name: "NEW HAMPSHIRE" },
    '34' => { abr: "NJ", full_name: "NEW JERSEY" },
    '35' => { abr: "NM", full_name: "NEW MEXICO" },
    '32' => { abr: "NV", full_name: "NEVADA" },
    '36' => { abr: "NY", full_name: "NEW YORK" },
    '39' => { abr: "OH", full_name: "OHIO" },
    '40' => { abr: "OK", full_name: "OKLAHOMA" },
    '41' => { abr: "OR", full_name: "OREGON" },
    '42' => { abr: "PA", full_name: "PENNSYLVANIA" },
    '72' => { abr: "PR", full_name: "PUERTO RICO" },
    '44' => { abr: "RI", full_name: "RHODE ISLAND" },
    '45' => { abr: "SC", full_name: "SOUTH CAROLINA" },
    '46' => { abr: "SD", full_name: "SOUTH DAKOTA" },
    '47' => { abr: "TN", full_name: "TENNESSEE" },
    '48' => { abr: "TX", full_name: "TEXAS" },
    '49' => { abr: "UT", full_name: "UTAH" },
    '51' => { abr: "VA", full_name: "VIRGINIA" },
    '78' => { abr: "VI", full_name: "VIRGIN ISLANDS" },
    '50' => { abr: "VT", full_name: "VERMONT" },
    '53' => { abr: "WA", full_name: "WASHINGTON" },
    '55' => { abr: "WI", full_name: "WISCONSIN" },
    '54' => { abr: "WV", full_name: "WEST VIRGINIA" },
    '56' => { abr: "WY", full_name: "WYOMING" }
  }


  conn = Faraday.new(:url => 'http://sushi.com') do |c|
    c.use Faraday::Request::UrlEncoded  # encode request params as "www-form-urlencoded"
    c.use Faraday::Response::Logger     # log request & response to STDOUT
    c.use Faraday::Adapter::NetHttp     # perform requests with Net::HTTP
  end

  response = conn.get 'http://api.census.gov/data/2010/sf1?for=state:*&get=PCO0090001,P0010001,H0030001,H0030002,H0030003&key=' + ENV[SENSUS_API_KEY]

  state_stats = JSON.parse(response.body)

  # Throw away first line of response, it's just explaining fields
  state_stats.shift

  state_stats.each do |stat|
    state = State.new :abr => state_fips_codes[stat[5]][:abr], :full_name => state_fips_codes[stat[5]][:full_name], :population_military => stat[0], :population_total => stat[1], :housing_units_total => stat[2], :housing_units_occupied => stat[3], :housing_units_vacant => stat[4]
    state.save
  end
end