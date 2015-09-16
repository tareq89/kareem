class DailyAccountsController < ApplicationController	
	def index
		@can_add_new_entry = false
		@daily_accounts = []
		if params[:uniq_date] != nil 
			if Date.today.to_s==params[:uniq_date]
				@can_add_new_entry = true				
				@date = Date.today.strftime("%A  %d %B %Y")
			else
				@date = Date.parse(params[:uniq_date]).strftime("%A  %d %B %Y")
			end

			if params[:is_debit] != "all"
				@daily_accounts = DailyAccount.where(:date => params[:uniq_date])
			else
				@daily_accounts = DailyAccount.where(:date => params[:uniq_date], :is_debit => param_is_debit)
			end			
		else			
			@daily_accounts = DailyAccount.all
		end

		@new_daily_account = DailyAccount.new
		@total_amount = DailyAccount.total_amount(@daily_accounts)
	end





	def create
		@new_daily_account = DailyAccount.new(create_daily_account_param)
		if @new_daily_account.save
			redirect_to daily_accounts_path(:uniq_date => Date.today)
		else
			@errors = []
			@new_daily_account.errors.full_messages.each do |msg| 
				@errors << msg
			end 
			print "This is error message : "
			print @errors
			print "\n"
			redirect_to daily_accounts_path(:uniq_date => Date.today, :errors => @errors, :is_debit => params[:is_debit])
		end	
	end





	def new
	end





	def edit
		@daily_account = DailyAccount.find(params[:id])
	end





	def show

	end





	def update
		@daily_account = DailyAccount.find(params[:id])
		if @daily_account.update_attributes(create_daily_account_param)
			redirect_to daily_accounts_path(:uniq_date => Date.today, :is_debit => params[:is_debit])
		else
			render 'edit'			
		end
	end





	def destroy
		DailyAccount.find(params[:id]).destroy
		redirect_to daily_accounts_path
	end
	private

		def param_is_debit
			if params[:is_debit] == "true"
				true
			elsif params[:is_debit] == "false"
				false
			end	
		end


		def daily_account_params
			params.require(:daily_account).permit(:category_spend, :amount, :note, :to_whome, :from_whom, :uniq_date, :account_type, :errors, :is_debit)
			
		end
		def create_daily_account_param
			params.require(:daily_account).permit(:category_spend, :amount, :note, :to_whome, :from_whom, :uniq_date, :account_type)
		end

end



