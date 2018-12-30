import vk_api
import time
vk = vk_api.VkApi(token = '61c64f4ff115b2dc53ce4b7c530b89da8a219de0ea6aff45016c9f781874fb54bc641fec61e6916c98232')

while True:
    messages = vk.method('messages.getConversations', {'offset':0, "count":20, 'filter': 'unread'})
    if messages["count"] >= 1:
        id = messages['items'][0]['last_message']["from_id"]
        body = messages["items"][0]['last_message']['text']
        if body.lower() == "привет":
            vk.method('messages.send', {'peer_id': id, 'message': "Привет!"})
        elif body.lower() == "...":
            vk.method('messages.send', {'peer_id': id, 'message': "...?!"})
        else:
            vk.method('messages.send', {'peer_id': id, 'message': "пока что одмен не решил ничего нового добавить, не знаю такой команды!"})
        time.sleep(1)
