class TransactionHandler
  class QuotaIsNotEnough < StandardError
    def message
      "Quota is not enough, check your amount of ticket again"
    end
  end
end
