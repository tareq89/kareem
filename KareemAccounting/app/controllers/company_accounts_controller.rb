class CompanyAccountsController < ApplicationController


	def index
		@company_accounts = CompanyAccount.all
		print @company_accounts
	end

	def create
		@new_company = CompanyAccount.new(create_company_account_params)
		if @new_company.save
			redirect_to company_accounts_path
		else
			redirect_to new_company_account_path
		end
	end

	def new
		@new_company = CompanyAccount.new
	end

	def edit

	end

	def show

	end

	def update

	end

	def destroy
	end

	private
		def param_is_debit
			if params[:buyer] == "1"
				params[:buyer] = true
			elsif params[:buyer] == "0"
				params[:buyer] = false
			end

			if params[:seller] == "1"
				params[:seller] = true
			elsif params[:seller] == "0"
				params[:seller] = false
			end
			print "******************************its happening****************************\n"
			print params[:seller]
			print params[:buyer]
			print "******************************its ending****************************\n"
		end
		def create_company_account_params
			param_is_debit
			print params
			params.require(:company_account).permit(:name,:address,:phone,:buyer,:seller)
		end
end
