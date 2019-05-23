class UserTicketsController < ApplicationController
  def index
    @user_tickets = UserTicket.where(user: User.find(session['warden.user.user.key'][0][0]) , paid: true)
  end

  def new
    @current_user= User.find(session['warden.user.user.key'][0][0])
    @user_ticket = UserTicket.new
  end

  def create
    @user_ticket = UserTicket.new(user_ticket_params)

    respond_to do |format|
      if @user_ticket.save
        format.html { render :shopping, notice: 'Ticket was successfully added to shopping cart.' }
      else
        format.html { render :new }
        format.json { render json: @user_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def shopping
    @user_tickets = UserTicket.where(user: current_user, paid: false)
  end

  def pay
    @user_tickets = UserTicket.where(user: current_user, paid: false)
    @user_tickets.update_all(paid: true)
  end
  def user_ticket_params
    params.require(:user_ticket).permit(:user_id, :ticket_id, :time, :paid)
  end
end
