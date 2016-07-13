defmodule Kik.Models.Message do
  @derive [Poison.Encoder]

  defstruct [:body, :chatId, :type, :from]

  @type t :: %Kik.Models.Message{
    body: String.t,
    chatId: String.t,
    type: String.t,
    from: String.t
  }
end

defmodule Kik.Models.Config do
  @derive [Poison.Encoder]

  defstruct [:webhook, :features]

  @type t :: %Kik.Models.Config{
    webhook: String.t,
    features: Kik.Models.ConfigFeatures.t
  }
end

defmodule Kik.Models.ConfigFeatures do
  @derive [Poison.Encoder]

  defstruct [:manuallySendReadReceipts, :receiveReadReceipts, :receiveDeliveryReceipts, :receiveIsTyping]

  @type t :: %Kik.Models.ConfigFeatures{
    manuallySendReadReceipts: Boolean.t,
    receiveReadReceipts: Boolean.t,
    receiveDeliveryReceipts: Boolean.t,
    receiveIsTyping: Boolean.t
  }
end

defmodule Kik.Models.UserProfile do
  @derive [Poison.Encoder]

  defstruct [:firstName, :lastName, :profilePicUrl, :profilePicLastModified]

  @type t :: %Kik.Models.UserProfile{
    firstName: String.t,
    lastName: String.t,
    profilePicUrl: String.t,
    profilePicLastModified: integer
  }
end

defmodule Kik.Models.Code do
  @derive [Poison.Encoder]

  defstruct [:id]

  @type t :: %Kik.Models.UserProfile{
    id: String.t
  }
end
