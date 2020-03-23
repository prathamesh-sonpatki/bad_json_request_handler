require "test_helper"

class BadJsonRequestHandlerTest < ActionDispatch::IntegrationTest
  def test_it_returns_bad_request_response_for_invalid_json
    post events_url, params: '{ event: { seconds: }}', headers: { 'Content-Type': 'application/json' }

    assert_response :bad_request
    body = JSON.parse(response.body)
    expected = { "errors" => { "message" => "Invalid request payload: 767: unexpected token at '{ event: { seconds: }}'" } }
    assert_equal expected, body
  end
end
