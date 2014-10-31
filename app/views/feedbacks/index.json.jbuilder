json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :user_id, :feedback_type, :content
  json.url feedback_url(feedback, format: :json)
end
