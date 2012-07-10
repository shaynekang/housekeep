module TransactionsHelper
  def default_transacted_at
    if params[:transacted_at]
      now = DateTime.now
      transacted_at = DateTime.parse(params[:transacted_at])
      transacted_at.change(hour: now.hour, min: now.minute)
    else
      @Transactions
    end
  end
end