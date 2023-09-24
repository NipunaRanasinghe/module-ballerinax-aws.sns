// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerinax/aws.sns;
import ballerina/log;

sns:AwsCredentials longTermCredentials = {
    accessKeyId: "<ACCESS_KEY_ID>",
    secretAccessKey: "<SECRET_ACCESS_KEY>"
};

sns:ConnectionConfig config = {
    credentials: longTermCredentials,
    region: "<REGION>"
};

public function main() returns error? {
    sns:Client snsClient = check new (config);

    sns:TopicAttributes attributes = {
        "displayName": "Test"
    };
    sns:CreateTopicResponse response = check snsClient->createTopic("testTopic", attributes);
    log:printInfo("Created topic arn: " + response.createTopicResult.topicArn.toString());
}