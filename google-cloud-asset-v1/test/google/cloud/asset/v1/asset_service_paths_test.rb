# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "helper"

require "gapic/grpc/service_stub"

require "google/cloud/asset/v1/asset_service"

class ::Google::Cloud::Asset::V1::AssetService::ClientPathsTest < Minitest::Test
  def test_feed_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Asset::V1::AssetService::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.feed_path project: "value0", feed: "value1"
      assert_equal "projects/value0/feeds/value1", path

      path = client.feed_path folder: "value0", feed: "value1"
      assert_equal "folders/value0/feeds/value1", path

      path = client.feed_path organization: "value0", feed: "value1"
      assert_equal "organizations/value0/feeds/value1", path
    end
  end
end
