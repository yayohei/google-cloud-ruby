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

require "google/cloud/talent/v4beta1/profile_service"

class ::Google::Cloud::Talent::V4beta1::ProfileService::ClientPathsTest < Minitest::Test
  def test_profile_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Talent::V4beta1::ProfileService::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.profile_path project: "value0", tenant: "value1", profile: "value2"
      assert_equal "projects/value0/tenants/value1/profiles/value2", path
    end
  end

  def test_tenant_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Talent::V4beta1::ProfileService::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.tenant_path project: "value0", tenant: "value1"
      assert_equal "projects/value0/tenants/value1", path
    end
  end
end
