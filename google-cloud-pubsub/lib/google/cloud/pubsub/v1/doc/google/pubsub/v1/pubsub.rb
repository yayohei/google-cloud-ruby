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


module Google
  module Cloud
  module PubSub
    module V1
      # @!attribute [rw] allowed_persistence_regions
      #   @return [Array<String>]
      #     A list of IDs of GCP regions where messages that are published to the topic
      #     may be persisted in storage. Messages published by publishers running in
      #     non-allowed GCP regions (or running outside of GCP altogether) will be
      #     routed for storage in one of the allowed regions. An empty list means that
      #     no regions are allowed, and is not a valid configuration.
      class MessageStoragePolicy; end

      # A topic resource.
      # @!attribute [rw] name
      #   @return [String]
      #     Required. The name of the topic. It must have the format
      #     `"projects/{project}/topics/{topic}"`. `{topic}` must start with a letter,
      #     and contain only letters (`[A-Za-z]`), numbers (`[0-9]`), dashes (`-`),
      #     underscores (`_`), periods (`.`), tildes (`~`), plus (`+`) or percent
      #     signs (`%`). It must be between 3 and 255 characters in length, and it
      #     must not start with `"goog"`.
      # @!attribute [rw] labels
      #   @return [Hash{String => String}]
      #     See <a href="https://cloud.google.com/pubsub/docs/labels"> Creating and
      #     managing labels</a>.
      # @!attribute [rw] message_storage_policy
      #   @return [Google::Cloud::PubSub::V1::MessageStoragePolicy]
      #     Policy constraining the set of Google Cloud Platform regions where messages
      #     published to the topic may be stored. If not present, then no constraints
      #     are in effect.
      # @!attribute [rw] kms_key_name
      #   @return [String]
      #     The resource name of the Cloud KMS CryptoKey to be used to protect access
      #     to messages published on this topic.
      #
      #     The expected format is `projects/*/locations/*/keyRings/*/cryptoKeys/*`.
      class Topic; end

      # A message that is published by publishers and consumed by subscribers. The
      # message must contain either a non-empty data field or at least one attribute.
      # Note that client libraries represent this object differently
      # depending on the language. See the corresponding
      # <a href="https://cloud.google.com/pubsub/docs/reference/libraries">client
      # library documentation</a> for more information. See
      # <a href="https://cloud.google.com/pubsub/quotas">Quotas and limits</a>
      # for more information about message limits.
      # @!attribute [rw] data
      #   @return [String]
      #     The message data field. If this field is empty, the message must contain
      #     at least one attribute.
      # @!attribute [rw] attributes
      #   @return [Hash{String => String}]
      #     Attributes for this message. If this field is empty, the message must
      #     contain non-empty data.
      # @!attribute [rw] message_id
      #   @return [String]
      #     ID of this message, assigned by the server when the message is published.
      #     Guaranteed to be unique within the topic. This value may be read by a
      #     subscriber that receives a `PubsubMessage` via a `Pull` call or a push
      #     delivery. It must not be populated by the publisher in a `Publish` call.
      # @!attribute [rw] publish_time
      #   @return [Google::Protobuf::Timestamp]
      #     The time at which the message was published, populated by the server when
      #     it receives the `Publish` call. It must not be populated by the
      #     publisher in a `Publish` call.
      # @!attribute [rw] ordering_key
      #   @return [String]
      #     If non-empty, identifies related messages for which publish order should be
      #     respected. If a `Subscription` has `enable_message_ordering` set to `true`,
      #     messages published with the same non-empty `ordering_key` value will be
      #     delivered to subscribers in the order in which they are received by the
      #     Pub/Sub system. All `PubsubMessage`s published in a given `PublishRequest`
      #     must specify the same `ordering_key` value.
      #     <b>EXPERIMENTAL:</b> This feature is part of a closed alpha release. This
      #     API might be changed in backward-incompatible ways and is not recommended
      #     for production use. It is not subject to any SLA or deprecation policy.
      class PubsubMessage; end

      # Request for the GetTopic method.
      # @!attribute [rw] topic
      #   @return [String]
      #     Required. The name of the topic to get.
      #     Format is `projects/{project}/topics/{topic}`.
      class GetTopicRequest; end

      # Request for the UpdateTopic method.
      # @!attribute [rw] topic
      #   @return [Google::Cloud::PubSub::V1::Topic]
      #     Required. The updated topic object.
      # @!attribute [rw] update_mask
      #   @return [Google::Protobuf::FieldMask]
      #     Required. Indicates which fields in the provided topic to update. Must be
      #     specified and non-empty. Note that if `update_mask` contains
      #     "message_storage_policy" but the `message_storage_policy` is not set in
      #     the `topic` provided above, then the updated value is determined by the
      #     policy configured at the project or organization level.
      class UpdateTopicRequest; end

      # Request for the Publish method.
      # @!attribute [rw] topic
      #   @return [String]
      #     Required. The messages in the request will be published on this topic.
      #     Format is `projects/{project}/topics/{topic}`.
      # @!attribute [rw] messages
      #   @return [Array<Google::Cloud::PubSub::V1::PubsubMessage>]
      #     Required. The messages to publish.
      class PublishRequest; end

      # Response for the `Publish` method.
      # @!attribute [rw] message_ids
      #   @return [Array<String>]
      #     The server-assigned ID of each published message, in the same order as
      #     the messages in the request. IDs are guaranteed to be unique within
      #     the topic.
      class PublishResponse; end

      # Request for the `ListTopics` method.
      # @!attribute [rw] project
      #   @return [String]
      #     Required. The name of the project in which to list topics.
      #     Format is `projects/{project-id}`.
      # @!attribute [rw] page_size
      #   @return [Integer]
      #     Maximum number of topics to return.
      # @!attribute [rw] page_token
      #   @return [String]
      #     The value returned by the last `ListTopicsResponse`; indicates that this is
      #     a continuation of a prior `ListTopics` call, and that the system should
      #     return the next page of data.
      class ListTopicsRequest; end

      # Response for the `ListTopics` method.
      # @!attribute [rw] topics
      #   @return [Array<Google::Cloud::PubSub::V1::Topic>]
      #     The resulting topics.
      # @!attribute [rw] next_page_token
      #   @return [String]
      #     If not empty, indicates that there may be more topics that match the
      #     request; this value should be passed in a new `ListTopicsRequest`.
      class ListTopicsResponse; end

      # Request for the `ListTopicSubscriptions` method.
      # @!attribute [rw] topic
      #   @return [String]
      #     Required. The name of the topic that subscriptions are attached to.
      #     Format is `projects/{project}/topics/{topic}`.
      # @!attribute [rw] page_size
      #   @return [Integer]
      #     Maximum number of subscription names to return.
      # @!attribute [rw] page_token
      #   @return [String]
      #     The value returned by the last `ListTopicSubscriptionsResponse`; indicates
      #     that this is a continuation of a prior `ListTopicSubscriptions` call, and
      #     that the system should return the next page of data.
      class ListTopicSubscriptionsRequest; end

      # Response for the `ListTopicSubscriptions` method.
      # @!attribute [rw] subscriptions
      #   @return [Array<String>]
      #     The names of the subscriptions that match the request.
      # @!attribute [rw] next_page_token
      #   @return [String]
      #     If not empty, indicates that there may be more subscriptions that match
      #     the request; this value should be passed in a new
      #     `ListTopicSubscriptionsRequest` to get more subscriptions.
      class ListTopicSubscriptionsResponse; end

      # Request for the `ListTopicSnapshots` method.
      # @!attribute [rw] topic
      #   @return [String]
      #     Required. The name of the topic that snapshots are attached to.
      #     Format is `projects/{project}/topics/{topic}`.
      # @!attribute [rw] page_size
      #   @return [Integer]
      #     Maximum number of snapshot names to return.
      # @!attribute [rw] page_token
      #   @return [String]
      #     The value returned by the last `ListTopicSnapshotsResponse`; indicates
      #     that this is a continuation of a prior `ListTopicSnapshots` call, and
      #     that the system should return the next page of data.
      class ListTopicSnapshotsRequest; end

      # Response for the `ListTopicSnapshots` method.
      # @!attribute [rw] snapshots
      #   @return [Array<String>]
      #     The names of the snapshots that match the request.
      # @!attribute [rw] next_page_token
      #   @return [String]
      #     If not empty, indicates that there may be more snapshots that match
      #     the request; this value should be passed in a new
      #     `ListTopicSnapshotsRequest` to get more snapshots.
      class ListTopicSnapshotsResponse; end

      # Request for the `DeleteTopic` method.
      # @!attribute [rw] topic
      #   @return [String]
      #     Required. Name of the topic to delete.
      #     Format is `projects/{project}/topics/{topic}`.
      class DeleteTopicRequest; end

      # A subscription resource.
      # @!attribute [rw] name
      #   @return [String]
      #     Required. The name of the subscription. It must have the format
      #     `"projects/{project}/subscriptions/{subscription}"`. `{subscription}` must
      #     start with a letter, and contain only letters (`[A-Za-z]`), numbers
      #     (`[0-9]`), dashes (`-`), underscores (`_`), periods (`.`), tildes (`~`),
      #     plus (`+`) or percent signs (`%`). It must be between 3 and 255 characters
      #     in length, and it must not start with `"goog"`.
      # @!attribute [rw] topic
      #   @return [String]
      #     Required. The name of the topic from which this subscription is receiving
      #     messages. Format is `projects/{project}/topics/{topic}`. The value of this
      #     field will be `_deleted-topic_` if the topic has been deleted.
      # @!attribute [rw] push_config
      #   @return [Google::Cloud::PubSub::V1::PushConfig]
      #     If push delivery is used with this subscription, this field is
      #     used to configure it. An empty `pushConfig` signifies that the subscriber
      #     will pull and ack messages using API methods.
      # @!attribute [rw] ack_deadline_seconds
      #   @return [Integer]
      #     The approximate amount of time (on a best-effort basis) Pub/Sub waits for
      #     the subscriber to acknowledge receipt before resending the message. In the
      #     interval after the message is delivered and before it is acknowledged, it
      #     is considered to be <i>outstanding</i>. During that time period, the
      #     message will not be redelivered (on a best-effort basis).
      #
      #     For pull subscriptions, this value is used as the initial value for the ack
      #     deadline. To override this value for a given message, call
      #     `ModifyAckDeadline` with the corresponding `ack_id` if using
      #     non-streaming pull or send the `ack_id` in a
      #     `StreamingModifyAckDeadlineRequest` if using streaming pull.
      #     The minimum custom deadline you can specify is 10 seconds.
      #     The maximum custom deadline you can specify is 600 seconds (10 minutes).
      #     If this parameter is 0, a default value of 10 seconds is used.
      #
      #     For push delivery, this value is also used to set the request timeout for
      #     the call to the push endpoint.
      #
      #     If the subscriber never acknowledges the message, the Pub/Sub
      #     system will eventually redeliver the message.
      # @!attribute [rw] retain_acked_messages
      #   @return [true, false]
      #     Indicates whether to retain acknowledged messages. If true, then
      #     messages are not expunged from the subscription's backlog, even if they are
      #     acknowledged, until they fall out of the `message_retention_duration`
      #     window. This must be true if you would like to
      #     <a
      #     href="https://cloud.google.com/pubsub/docs/replay-overview#seek_to_a_time">
      #     Seek to a timestamp</a>.
      # @!attribute [rw] message_retention_duration
      #   @return [Google::Protobuf::Duration]
      #     How long to retain unacknowledged messages in the subscription's backlog,
      #     from the moment a message is published.
      #     If `retain_acked_messages` is true, then this also configures the retention
      #     of acknowledged messages, and thus configures how far back in time a `Seek`
      #     can be done. Defaults to 7 days. Cannot be more than 7 days or less than 10
      #     minutes.
      # @!attribute [rw] labels
      #   @return [Hash{String => String}]
      #     See <a href="https://cloud.google.com/pubsub/docs/labels"> Creating and
      #     managing labels</a>.
      # @!attribute [rw] enable_message_ordering
      #   @return [true, false]
      #     If true, messages published with the same `ordering_key` in `PubsubMessage`
      #     will be delivered to the subscribers in the order in which they
      #     are received by the Pub/Sub system. Otherwise, they may be delivered in
      #     any order.
      #     <b>EXPERIMENTAL:</b> This feature is part of a closed alpha release. This
      #     API might be changed in backward-incompatible ways and is not recommended
      #     for production use. It is not subject to any SLA or deprecation policy.
      # @!attribute [rw] expiration_policy
      #   @return [Google::Cloud::PubSub::V1::ExpirationPolicy]
      #     A policy that specifies the conditions for this subscription's expiration.
      #     A subscription is considered active as long as any connected subscriber is
      #     successfully consuming messages from the subscription or is issuing
      #     operations on the subscription. If `expiration_policy` is not set, a
      #     *default policy* with `ttl` of 31 days will be used. The minimum allowed
      #     value for `expiration_policy.ttl` is 1 day.
      # @!attribute [rw] filter
      #   @return [String]
      #     An expression written in the Cloud Pub/Sub filter language. If non-empty,
      #     then only `PubsubMessage`s whose `attributes` field matches the filter are
      #     delivered on this subscription. If empty, then no messages are filtered
      #     out.
      #     <b>EXPERIMENTAL:</b> This feature is part of a closed alpha release. This
      #     API might be changed in backward-incompatible ways and is not recommended
      #     for production use. It is not subject to any SLA or deprecation policy.
      # @!attribute [rw] dead_letter_policy
      #   @return [Google::Cloud::PubSub::V1::DeadLetterPolicy]
      #     A policy that specifies the conditions for dead lettering messages in
      #     this subscription. If dead_letter_policy is not set, dead lettering
      #     is disabled.
      #
      #     The Cloud Pub/Sub service account associated with this subscriptions's
      #     parent project (i.e.,
      #     service-\\{project_number}@gcp-sa-pubsub.iam.gserviceaccount.com) must have
      #     permission to Acknowledge() messages on this subscription.
      # @!attribute [rw] retry_policy
      #   @return [Google::Cloud::PubSub::V1::RetryPolicy]
      #     A policy that specifies how Cloud Pub/Sub retries message delivery for this
      #     subscription.
      #
      #     If not set, the default retry policy is applied. This generally implies
      #     that messages will be retried as soon as possible for healthy subscribers.
      #     RetryPolicy will be triggered on NACKs or acknowledgement deadline
      #     exceeded events for a given message.
      #     <b>EXPERIMENTAL:</b> This API might be changed in backward-incompatible
      #     ways and is not recommended for production use. It is not subject to any
      #     SLA or deprecation policy.
      class Subscription; end

      # A policy that specifies how Cloud Pub/Sub retries message delivery.
      #
      # Retry delay will be exponential based on provided minimum and maximum
      # backoffs. https://en.wikipedia.org/wiki/Exponential_backoff.
      #
      # RetryPolicy will be triggered on NACKs or acknowledgement deadline exceeded
      # events for a given message.
      #
      # Retry Policy is implemented on a best effort basis. At times, the delay
      # between consecutive deliveries may not match the configuration. That is,
      # delay can be more or less than configured backoff.
      # @!attribute [rw] minimum_backoff
      #   @return [Google::Protobuf::Duration]
      #     The minimum delay between consecutive deliveries of a given message.
      #     Value should be between 0 and 600 seconds. Defaults to 10 seconds.
      # @!attribute [rw] maximum_backoff
      #   @return [Google::Protobuf::Duration]
      #     The maximum delay between consecutive deliveries of a given message.
      #     Value should be between 0 and 600 seconds. Defaults to 600 seconds.
      class RetryPolicy; end

      # Dead lettering is done on a best effort basis. The same message might be
      # dead lettered multiple times.
      #
      # If validation on any of the fields fails at subscription creation/updation,
      # the create/update subscription request will fail.
      # @!attribute [rw] dead_letter_topic
      #   @return [String]
      #     The name of the topic to which dead letter messages should be published.
      #     Format is `projects/{project}/topics/{topic}`.The Cloud Pub/Sub service
      #     account associated with the enclosing subscription's parent project (i.e.,
      #     service-\\{project_number}@gcp-sa-pubsub.iam.gserviceaccount.com) must have
      #     permission to Publish() to this topic.
      #
      #     The operation will fail if the topic does not exist.
      #     Users should ensure that there is a subscription attached to this topic
      #     since messages published to a topic with no subscriptions are lost.
      # @!attribute [rw] max_delivery_attempts
      #   @return [Integer]
      #     The maximum number of delivery attempts for any message. The value must be
      #     between 5 and 100.
      #
      #     The number of delivery attempts is defined as 1 + (the sum of number of
      #     NACKs and number of times the acknowledgement deadline has been exceeded
      #     for the message).
      #
      #     A NACK is any call to ModifyAckDeadline with a 0 deadline. Note that
      #     client libraries may automatically extend ack_deadlines.
      #
      #     This field will be honored on a best effort basis.
      #
      #     If this parameter is 0, a default value of 5 is used.
      class DeadLetterPolicy; end

      # A policy that specifies the conditions for resource expiration (i.e.,
      # automatic resource deletion).
      # @!attribute [rw] ttl
      #   @return [Google::Protobuf::Duration]
      #     Specifies the "time-to-live" duration for an associated resource. The
      #     resource expires if it is not active for a period of `ttl`. The definition
      #     of "activity" depends on the type of the associated resource. The minimum
      #     and maximum allowed values for `ttl` depend on the type of the associated
      #     resource, as well. If `ttl` is not set, the associated resource never
      #     expires.
      class ExpirationPolicy; end

      # Configuration for a push delivery endpoint.
      # @!attribute [rw] push_endpoint
      #   @return [String]
      #     A URL locating the endpoint to which messages should be pushed.
      #     For example, a Webhook endpoint might use `https://example.com/push`.
      # @!attribute [rw] attributes
      #   @return [Hash{String => String}]
      #     Endpoint configuration attributes that can be used to control different
      #     aspects of the message delivery.
      #
      #     The only currently supported attribute is `x-goog-version`, which you can
      #     use to change the format of the pushed message. This attribute
      #     indicates the version of the data expected by the endpoint. This
      #     controls the shape of the pushed message (i.e., its fields and metadata).
      #
      #     If not present during the `CreateSubscription` call, it will default to
      #     the version of the Pub/Sub API used to make such call. If not present in a
      #     `ModifyPushConfig` call, its value will not be changed. `GetSubscription`
      #     calls will always return a valid version, even if the subscription was
      #     created without this attribute.
      #
      #     The only supported values for the `x-goog-version` attribute are:
      #
      #     * `v1beta1`: uses the push format defined in the v1beta1 Pub/Sub API.
      #     * `v1` or `v1beta2`: uses the push format defined in the v1 Pub/Sub API.
      #
      #     For example:
      #     <pre><code>attributes { "x-goog-version": "v1" } </code></pre>
      # @!attribute [rw] oidc_token
      #   @return [Google::Cloud::PubSub::V1::PushConfig::OidcToken]
      #     If specified, Pub/Sub will generate and attach an OIDC JWT token as an
      #     `Authorization` header in the HTTP request for every pushed message.
      class PushConfig
        # Contains information needed for generating an
        # [OpenID Connect
        # token](https://developers.google.com/identity/protocols/OpenIDConnect).
        # @!attribute [rw] service_account_email
        #   @return [String]
        #     [Service account
        #     email](https://cloud.google.com/iam/docs/service-accounts)
        #     to be used for generating the OIDC token. The caller (for
        #     CreateSubscription, UpdateSubscription, and ModifyPushConfig RPCs) must
        #     have the iam.serviceAccounts.actAs permission for the service account.
        # @!attribute [rw] audience
        #   @return [String]
        #     Audience to be used when generating OIDC token. The audience claim
        #     identifies the recipients that the JWT is intended for. The audience
        #     value is a single case-sensitive string. Having multiple values (array)
        #     for the audience field is not supported. More info about the OIDC JWT
        #     token audience here: https://tools.ietf.org/html/rfc7519#section-4.1.3
        #     Note: if not specified, the Push endpoint URL will be used.
        class OidcToken; end
      end

      # A message and its corresponding acknowledgment ID.
      # @!attribute [rw] ack_id
      #   @return [String]
      #     This ID can be used to acknowledge the received message.
      # @!attribute [rw] message
      #   @return [Google::Cloud::PubSub::V1::PubsubMessage]
      #     The message.
      # @!attribute [rw] delivery_attempt
      #   @return [Integer]
      #     The approximate number of times that Cloud Pub/Sub has attempted to deliver
      #     the associated message to a subscriber.
      #
      #     More precisely, this is 1 + (number of NACKs) +
      #     (number of ack_deadline exceeds) for this message.
      #
      #     A NACK is any call to ModifyAckDeadline with a 0 deadline. An ack_deadline
      #     exceeds event is whenever a message is not acknowledged within
      #     ack_deadline. Note that ack_deadline is initially
      #     Subscription.ackDeadlineSeconds, but may get extended automatically by
      #     the client library.
      #
      #     Upon the first delivery of a given message, `delivery_attempt` will have a
      #     value of 1. The value is calculated at best effort and is approximate.
      #
      #     If a DeadLetterPolicy is not set on the subscription, this will be 0.
      class ReceivedMessage; end

      # Request for the GetSubscription method.
      # @!attribute [rw] subscription
      #   @return [String]
      #     Required. The name of the subscription to get.
      #     Format is `projects/{project}/subscriptions/{sub}`.
      class GetSubscriptionRequest; end

      # Request for the UpdateSubscription method.
      # @!attribute [rw] subscription
      #   @return [Google::Cloud::PubSub::V1::Subscription]
      #     Required. The updated subscription object.
      # @!attribute [rw] update_mask
      #   @return [Google::Protobuf::FieldMask]
      #     Required. Indicates which fields in the provided subscription to update.
      #     Must be specified and non-empty.
      class UpdateSubscriptionRequest; end

      # Request for the `ListSubscriptions` method.
      # @!attribute [rw] project
      #   @return [String]
      #     Required. The name of the project in which to list subscriptions.
      #     Format is `projects/{project-id}`.
      # @!attribute [rw] page_size
      #   @return [Integer]
      #     Maximum number of subscriptions to return.
      # @!attribute [rw] page_token
      #   @return [String]
      #     The value returned by the last `ListSubscriptionsResponse`; indicates that
      #     this is a continuation of a prior `ListSubscriptions` call, and that the
      #     system should return the next page of data.
      class ListSubscriptionsRequest; end

      # Response for the `ListSubscriptions` method.
      # @!attribute [rw] subscriptions
      #   @return [Array<Google::Cloud::PubSub::V1::Subscription>]
      #     The subscriptions that match the request.
      # @!attribute [rw] next_page_token
      #   @return [String]
      #     If not empty, indicates that there may be more subscriptions that match
      #     the request; this value should be passed in a new
      #     `ListSubscriptionsRequest` to get more subscriptions.
      class ListSubscriptionsResponse; end

      # Request for the DeleteSubscription method.
      # @!attribute [rw] subscription
      #   @return [String]
      #     Required. The subscription to delete.
      #     Format is `projects/{project}/subscriptions/{sub}`.
      class DeleteSubscriptionRequest; end

      # Request for the ModifyPushConfig method.
      # @!attribute [rw] subscription
      #   @return [String]
      #     Required. The name of the subscription.
      #     Format is `projects/{project}/subscriptions/{sub}`.
      # @!attribute [rw] push_config
      #   @return [Google::Cloud::PubSub::V1::PushConfig]
      #     Required. The push configuration for future deliveries.
      #
      #     An empty `pushConfig` indicates that the Pub/Sub system should
      #     stop pushing messages from the given subscription and allow
      #     messages to be pulled and acknowledged - effectively pausing
      #     the subscription if `Pull` or `StreamingPull` is not called.
      class ModifyPushConfigRequest; end

      # Request for the `Pull` method.
      # @!attribute [rw] subscription
      #   @return [String]
      #     Required. The subscription from which messages should be pulled.
      #     Format is `projects/{project}/subscriptions/{sub}`.
      # @!attribute [rw] return_immediately
      #   @return [true, false]
      #     Optional. If this field set to true, the system will respond immediately
      #     even if it there are no messages available to return in the `Pull`
      #     response. Otherwise, the system may wait (for a bounded amount of time)
      #     until at least one message is available, rather than returning no messages.
      #     Warning: setting this field to `true` is discouraged because it adversely
      #     impacts the performance of `Pull` operations. We recommend that users do
      #     not set this field.
      # @!attribute [rw] max_messages
      #   @return [Integer]
      #     Required. The maximum number of messages to return for this request. Must
      #     be a positive integer. The Pub/Sub system may return fewer than the number
      #     specified.
      class PullRequest; end

      # Response for the `Pull` method.
      # @!attribute [rw] received_messages
      #   @return [Array<Google::Cloud::PubSub::V1::ReceivedMessage>]
      #     Received Pub/Sub messages. The list will be empty if there are no more
      #     messages available in the backlog. For JSON, the response can be entirely
      #     empty. The Pub/Sub system may return fewer than the `maxMessages` requested
      #     even if there are more messages available in the backlog.
      class PullResponse; end

      # Request for the ModifyAckDeadline method.
      # @!attribute [rw] subscription
      #   @return [String]
      #     Required. The name of the subscription.
      #     Format is `projects/{project}/subscriptions/{sub}`.
      # @!attribute [rw] ack_ids
      #   @return [Array<String>]
      #     Required. List of acknowledgment IDs.
      # @!attribute [rw] ack_deadline_seconds
      #   @return [Integer]
      #     Required. The new ack deadline with respect to the time this request was
      #     sent to the Pub/Sub system. For example, if the value is 10, the new ack
      #     deadline will expire 10 seconds after the `ModifyAckDeadline` call was
      #     made. Specifying zero might immediately make the message available for
      #     delivery to another subscriber client. This typically results in an
      #     increase in the rate of message redeliveries (that is, duplicates).
      #     The minimum deadline you can specify is 0 seconds.
      #     The maximum deadline you can specify is 600 seconds (10 minutes).
      class ModifyAckDeadlineRequest; end

      # Request for the Acknowledge method.
      # @!attribute [rw] subscription
      #   @return [String]
      #     Required. The subscription whose message is being acknowledged.
      #     Format is `projects/{project}/subscriptions/{sub}`.
      # @!attribute [rw] ack_ids
      #   @return [Array<String>]
      #     Required. The acknowledgment ID for the messages being acknowledged that
      #     was returned by the Pub/Sub system in the `Pull` response. Must not be
      #     empty.
      class AcknowledgeRequest; end

      # Request for the `StreamingPull` streaming RPC method. This request is used to
      # establish the initial stream as well as to stream acknowledgements and ack
      # deadline modifications from the client to the server.
      # @!attribute [rw] subscription
      #   @return [String]
      #     Required. The subscription for which to initialize the new stream. This
      #     must be provided in the first request on the stream, and must not be set in
      #     subsequent requests from client to server.
      #     Format is `projects/{project}/subscriptions/{sub}`.
      # @!attribute [rw] ack_ids
      #   @return [Array<String>]
      #     List of acknowledgement IDs for acknowledging previously received messages
      #     (received on this stream or a different stream). If an ack ID has expired,
      #     the corresponding message may be redelivered later. Acknowledging a message
      #     more than once will not result in an error. If the acknowledgement ID is
      #     malformed, the stream will be aborted with status `INVALID_ARGUMENT`.
      # @!attribute [rw] modify_deadline_seconds
      #   @return [Array<Integer>]
      #     The list of new ack deadlines for the IDs listed in
      #     `modify_deadline_ack_ids`. The size of this list must be the same as the
      #     size of `modify_deadline_ack_ids`. If it differs the stream will be aborted
      #     with `INVALID_ARGUMENT`. Each element in this list is applied to the
      #     element in the same position in `modify_deadline_ack_ids`. The new ack
      #     deadline is with respect to the time this request was sent to the Pub/Sub
      #     system. Must be >= 0. For example, if the value is 10, the new ack deadline
      #     will expire 10 seconds after this request is received. If the value is 0,
      #     the message is immediately made available for another streaming or
      #     non-streaming pull request. If the value is < 0 (an error), the stream will
      #     be aborted with status `INVALID_ARGUMENT`.
      # @!attribute [rw] modify_deadline_ack_ids
      #   @return [Array<String>]
      #     List of acknowledgement IDs whose deadline will be modified based on the
      #     corresponding element in `modify_deadline_seconds`. This field can be used
      #     to indicate that more time is needed to process a message by the
      #     subscriber, or to make the message available for redelivery if the
      #     processing was interrupted.
      # @!attribute [rw] stream_ack_deadline_seconds
      #   @return [Integer]
      #     Required. The ack deadline to use for the stream. This must be provided in
      #     the first request on the stream, but it can also be updated on subsequent
      #     requests from client to server. The minimum deadline you can specify is 10
      #     seconds. The maximum deadline you can specify is 600 seconds (10 minutes).
      # @!attribute [rw] client_id
      #   @return [String]
      #     A unique identifier that is used to distinguish client instances from each
      #     other. Only needs to be provided on the initial request. When a stream
      #     disconnects and reconnects for the same stream, the client_id should be set
      #     to the same value so that state associated with the old stream can be
      #     transferred to the new stream. The same client_id should not be used for
      #     different client instances.
      class StreamingPullRequest; end

      # Response for the `StreamingPull` method. This response is used to stream
      # messages from the server to the client.
      # @!attribute [rw] received_messages
      #   @return [Array<Google::Cloud::PubSub::V1::ReceivedMessage>]
      #     Received Pub/Sub messages. This will not be empty.
      class StreamingPullResponse; end

      # Request for the `CreateSnapshot` method.
      # @!attribute [rw] name
      #   @return [String]
      #     Required. User-provided name for this snapshot. If the name is not provided
      #     in the request, the server will assign a random name for this snapshot on
      #     the same project as the subscription. Note that for REST API requests, you
      #     must specify a name.  See the <a
      #     href="https://cloud.google.com/pubsub/docs/admin#resource_names"> resource
      #     name rules</a>. Format is `projects/{project}/snapshots/{snap}`.
      # @!attribute [rw] subscription
      #   @return [String]
      #     Required. The subscription whose backlog the snapshot retains.
      #     Specifically, the created snapshot is guaranteed to retain:
      #      (a) The existing backlog on the subscription. More precisely, this is
      #          defined as the messages in the subscription's backlog that are
      #          unacknowledged upon the successful completion of the
      #          `CreateSnapshot` request; as well as:
      #      (b) Any messages published to the subscription's topic following the
      #          successful completion of the CreateSnapshot request.
      #     Format is `projects/{project}/subscriptions/{sub}`.
      # @!attribute [rw] labels
      #   @return [Hash{String => String}]
      #     See <a href="https://cloud.google.com/pubsub/docs/labels"> Creating and
      #     managing labels</a>.
      class CreateSnapshotRequest; end

      # Request for the UpdateSnapshot method.
      # @!attribute [rw] snapshot
      #   @return [Google::Cloud::PubSub::V1::Snapshot]
      #     Required. The updated snapshot object.
      # @!attribute [rw] update_mask
      #   @return [Google::Protobuf::FieldMask]
      #     Required. Indicates which fields in the provided snapshot to update.
      #     Must be specified and non-empty.
      class UpdateSnapshotRequest; end

      # A snapshot resource. Snapshots are used in
      # <a href="https://cloud.google.com/pubsub/docs/replay-overview">Seek</a>
      # operations, which allow
      # you to manage message acknowledgments in bulk. That is, you can set the
      # acknowledgment state of messages in an existing subscription to the state
      # captured by a snapshot.
      # @!attribute [rw] name
      #   @return [String]
      #     The name of the snapshot.
      # @!attribute [rw] topic
      #   @return [String]
      #     The name of the topic from which this snapshot is retaining messages.
      # @!attribute [rw] expire_time
      #   @return [Google::Protobuf::Timestamp]
      #     The snapshot is guaranteed to exist up until this time.
      #     A newly-created snapshot expires no later than 7 days from the time of its
      #     creation. Its exact lifetime is determined at creation by the existing
      #     backlog in the source subscription. Specifically, the lifetime of the
      #     snapshot is `7 days - (age of oldest unacked message in the subscription)`.
      #     For example, consider a subscription whose oldest unacked message is 3 days
      #     old. If a snapshot is created from this subscription, the snapshot -- which
      #     will always capture this 3-day-old backlog as long as the snapshot
      #     exists -- will expire in 4 days. The service will refuse to create a
      #     snapshot that would expire in less than 1 hour after creation.
      # @!attribute [rw] labels
      #   @return [Hash{String => String}]
      #     See <a href="https://cloud.google.com/pubsub/docs/labels"> Creating and
      #     managing labels</a>.
      class Snapshot; end

      # Request for the GetSnapshot method.
      # @!attribute [rw] snapshot
      #   @return [String]
      #     Required. The name of the snapshot to get.
      #     Format is `projects/{project}/snapshots/{snap}`.
      class GetSnapshotRequest; end

      # Request for the `ListSnapshots` method.
      # @!attribute [rw] project
      #   @return [String]
      #     Required. The name of the project in which to list snapshots.
      #     Format is `projects/{project-id}`.
      # @!attribute [rw] page_size
      #   @return [Integer]
      #     Maximum number of snapshots to return.
      # @!attribute [rw] page_token
      #   @return [String]
      #     The value returned by the last `ListSnapshotsResponse`; indicates that this
      #     is a continuation of a prior `ListSnapshots` call, and that the system
      #     should return the next page of data.
      class ListSnapshotsRequest; end

      # Response for the `ListSnapshots` method.
      # @!attribute [rw] snapshots
      #   @return [Array<Google::Cloud::PubSub::V1::Snapshot>]
      #     The resulting snapshots.
      # @!attribute [rw] next_page_token
      #   @return [String]
      #     If not empty, indicates that there may be more snapshot that match the
      #     request; this value should be passed in a new `ListSnapshotsRequest`.
      class ListSnapshotsResponse; end

      # Request for the `DeleteSnapshot` method.
      # @!attribute [rw] snapshot
      #   @return [String]
      #     Required. The name of the snapshot to delete.
      #     Format is `projects/{project}/snapshots/{snap}`.
      class DeleteSnapshotRequest; end

      # Request for the `Seek` method.
      # @!attribute [rw] subscription
      #   @return [String]
      #     Required. The subscription to affect.
      # @!attribute [rw] time
      #   @return [Google::Protobuf::Timestamp]
      #     The time to seek to.
      #     Messages retained in the subscription that were published before this
      #     time are marked as acknowledged, and messages retained in the
      #     subscription that were published after this time are marked as
      #     unacknowledged. Note that this operation affects only those messages
      #     retained in the subscription (configured by the combination of
      #     `message_retention_duration` and `retain_acked_messages`). For example,
      #     if `time` corresponds to a point before the message retention
      #     window (or to a point before the system's notion of the subscription
      #     creation time), only retained messages will be marked as unacknowledged,
      #     and already-expunged messages will not be restored.
      # @!attribute [rw] snapshot
      #   @return [String]
      #     The snapshot to seek to. The snapshot's topic must be the same as that of
      #     the provided subscription.
      #     Format is `projects/{project}/snapshots/{snap}`.
      class SeekRequest; end

      # Response for the `Seek` method (this response is empty).
      class SeekResponse; end
    end
  end
  end
end