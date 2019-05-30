class TransactionHandler
  class QuotaIsNotEnough < StandardError
    def message
      "Quota is not enough, check your amount of ticket again"
    end
  end

  class CategoryTicketIsExist < StandardError
    def message
      "Category ticket is already exist for the event, check again"
    end
  end

  class TicketEventExceed < StandardError
    def message
      "Cannot buy ticket from multiple Event, One transaction only for one event"
    end
  end

  class AmountTicketIsNegative < StandardError
    def message
      "Amount of ticket cannot be zero or negative"
    end
  end

  class PriceIsNegative < StandardError
    def message
      "Price cannot be negative"
    end
  end

  class QuotaIsNegative < StandardError
    def message
      "Quota cannot be negative"
    end
  end
end
