import discord
from gemini import chat
import os

TOKEN = os.getenv('BOT_TOKEN', None)
ALLOWED_CHANNEL_ID = os.getenv('ALLOWED_CHANNEL_ID', None)

intents = discord.Intents.default()
intents.message_content = True

client = discord.Client(intents=intents)

@client.event
async def on_ready():
    print(f'Logged in as {client.user.name} - {client.user.id}')
    print('------')

@client.event
async def on_message(message):
    if message.author == client.user:
        return

    if message.channel.id == ALLOWED_CHANNEL_ID:
        await message.channel.send(chat(message.content))

client.run(TOKEN)
