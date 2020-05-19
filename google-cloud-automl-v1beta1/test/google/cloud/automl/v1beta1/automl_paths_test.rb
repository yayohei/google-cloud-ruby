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

require "google/cloud/automl/v1beta1/automl"

class ::Google::Cloud::AutoML::V1beta1::AutoML::ClientPathsTest < Minitest::Test
  def test_annotation_spec_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::AutoML::V1beta1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.annotation_spec_path project: "value0", location: "value1", dataset: "value2", annotation_spec: "value3"
      assert_equal "projects/value0/locations/value1/datasets/value2/annotationSpecs/value3", path
    end
  end

  def test_column_spec_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::AutoML::V1beta1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.column_spec_path project: "value0", location: "value1", dataset: "value2", table_spec: "value3", column_spec: "value4"
      assert_equal "projects/value0/locations/value1/datasets/value2/tableSpecs/value3/columnSpecs/value4", path
    end
  end

  def test_dataset_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::AutoML::V1beta1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.dataset_path project: "value0", location: "value1", dataset: "value2"
      assert_equal "projects/value0/locations/value1/datasets/value2", path
    end
  end

  def test_location_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::AutoML::V1beta1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.location_path project: "value0", location: "value1"
      assert_equal "projects/value0/locations/value1", path
    end
  end

  def test_model_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::AutoML::V1beta1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.model_path project: "value0", location: "value1", model: "value2"
      assert_equal "projects/value0/locations/value1/models/value2", path
    end
  end

  def test_model_evaluation_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::AutoML::V1beta1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.model_evaluation_path project: "value0", location: "value1", model: "value2", model_evaluation: "value3"
      assert_equal "projects/value0/locations/value1/models/value2/modelEvaluations/value3", path
    end
  end

  def test_table_spec_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::AutoML::V1beta1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.table_spec_path project: "value0", location: "value1", dataset: "value2", table_spec: "value3"
      assert_equal "projects/value0/locations/value1/datasets/value2/tableSpecs/value3", path
    end
  end
end
