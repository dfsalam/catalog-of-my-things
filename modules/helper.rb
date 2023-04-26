require 'date'

module Helper
  def nb_years_passed(date)
    now = Date.today
    date = Date.parse(date)
    (now - date).to_i / 365
  end
end
