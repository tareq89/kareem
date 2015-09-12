class WelcomeController < ApplicationController
  def index
  	@uniq_dates_from_daily_accounts = DailyAccount.uniq.pluck(:date)
  end
end
