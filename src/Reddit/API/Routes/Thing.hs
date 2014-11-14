module Reddit.API.Routes.Thing where

import Reddit.API.Types.Thing

import Data.Text (Text)
import Network.API.Builder.Routes

reply :: Thing a => a -> Text -> Route
reply thingID body = Route [ "api", "comment" ]
                           [ "parent" =. fullName thingID
                           , "text" =. body ]
                           "POST"

delete :: Thing a => a -> Route
delete t = Route [ "api", "del" ]
                 [ "id" =. fullName t ]
                 "POST"

edit :: Thing a => a -> Text -> Route
edit t newText = Route [ "api", "editusertext" ]
                       [ "thing_id" =. fullName t
                       , "text" =. newText ]
                       "POST"
