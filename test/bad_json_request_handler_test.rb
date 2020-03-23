require "test_helper"

class BadJsonRequestHandlerTest < ActionDispatch::IntegrationTest
  def test_it_returns_bad_request_response_for_invalid_json
    post events_url, params: '{ event: { seconds: }}', headers: { 'Content-Type': 'application/json' }

    assert_response :bad_request
    body = JSON.parse(response.body)
    expected = "Invalid request payload:"
    assert_includes body.dig('errors', 'message'), expected
  end
end
