/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

#include "TAsyncChannel.h"
#include <tr1/functional>

namespace apache { namespace thrift { namespace async {

bool TAsyncChannel::sendAndRecvMessage(const VoidCallback& cob,
                                       TMemoryBuffer* sendBuf,
                                       TMemoryBuffer* recvBuf) {
  std::tr1::function<void()> send_done =
    std::tr1::bind(&TAsyncChannel::recvMessage, this, cob, recvBuf);

  return sendMessage(send_done, sendBuf);
}

}}}  // apache::thrift::async
