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

require "google/cloud/talent/v4beta1/application_service_pb"
require "google/cloud/talent/v4beta1/application_service_services_pb"
require "google/cloud/talent/v4beta1/application_service"

class ::Google::Cloud::Talent::V4beta1::ApplicationService::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args
      @call_rpc_count += 1

      @requests << @block&.call(*args)

      yield @response, @operation if block_given?

      @response
    end
  end

  def test_create_application
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Talent::V4beta1::Application.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    application = {}

    create_application_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_application, name
      assert_kind_of ::Google::Cloud::Talent::V4beta1::CreateApplicationRequest, request
      assert_equal "hello world", request.parent
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Talent::V4beta1::Application), request.application
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_application_client_stub do
      # Create client
      client = ::Google::Cloud::Talent::V4beta1::ApplicationService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_application({ parent: parent, application: application }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_application parent: parent, application: application do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_application ::Google::Cloud::Talent::V4beta1::CreateApplicationRequest.new(parent: parent, application: application) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_application({ parent: parent, application: application }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_application ::Google::Cloud::Talent::V4beta1::CreateApplicationRequest.new(parent: parent, application: application), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_application_client_stub.call_rpc_count
    end
  end

  def test_get_application
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Talent::V4beta1::Application.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_application_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_application, name
      assert_kind_of ::Google::Cloud::Talent::V4beta1::GetApplicationRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_application_client_stub do
      # Create client
      client = ::Google::Cloud::Talent::V4beta1::ApplicationService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_application({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_application name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_application ::Google::Cloud::Talent::V4beta1::GetApplicationRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_application({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_application ::Google::Cloud::Talent::V4beta1::GetApplicationRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_application_client_stub.call_rpc_count
    end
  end

  def test_update_application
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Talent::V4beta1::Application.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    application = {}
    update_mask = {}

    update_application_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_application, name
      assert_kind_of ::Google::Cloud::Talent::V4beta1::UpdateApplicationRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Talent::V4beta1::Application), request.application
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_application_client_stub do
      # Create client
      client = ::Google::Cloud::Talent::V4beta1::ApplicationService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_application({ application: application, update_mask: update_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_application application: application, update_mask: update_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_application ::Google::Cloud::Talent::V4beta1::UpdateApplicationRequest.new(application: application, update_mask: update_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_application({ application: application, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_application ::Google::Cloud::Talent::V4beta1::UpdateApplicationRequest.new(application: application, update_mask: update_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_application_client_stub.call_rpc_count
    end
  end

  def test_delete_application
    # Create GRPC objects.
    grpc_response = ::Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_application_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_application, name
      assert_kind_of ::Google::Cloud::Talent::V4beta1::DeleteApplicationRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_application_client_stub do
      # Create client
      client = ::Google::Cloud::Talent::V4beta1::ApplicationService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_application({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_application name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_application ::Google::Cloud::Talent::V4beta1::DeleteApplicationRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_application({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_application ::Google::Cloud::Talent::V4beta1::DeleteApplicationRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_application_client_stub.call_rpc_count
    end
  end

  def test_list_applications
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Talent::V4beta1::ListApplicationsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_token = "hello world"
    page_size = 42

    list_applications_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_applications, name
      assert_kind_of ::Google::Cloud::Talent::V4beta1::ListApplicationsRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.page_token
      assert_equal 42, request.page_size
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_applications_client_stub do
      # Create client
      client = ::Google::Cloud::Talent::V4beta1::ApplicationService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_applications({ parent: parent, page_token: page_token, page_size: page_size }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_applications parent: parent, page_token: page_token, page_size: page_size do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_applications ::Google::Cloud::Talent::V4beta1::ListApplicationsRequest.new(parent: parent, page_token: page_token, page_size: page_size) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_applications({ parent: parent, page_token: page_token, page_size: page_size }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_applications ::Google::Cloud::Talent::V4beta1::ListApplicationsRequest.new(parent: parent, page_token: page_token, page_size: page_size), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_applications_client_stub.call_rpc_count
    end
  end

  def test_configure
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = block_config = config = nil
    Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Talent::V4beta1::ApplicationService::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of ::Google::Cloud::Talent::V4beta1::ApplicationService::Client::Configuration, config
  end
end
