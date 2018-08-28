class BookRentSerializer < ActiveModel::Serializer
   attributes :id, :from, :to, :book_id, :user_id, :returned_at

   #has_many :rent

    def returned_at
    end

end
