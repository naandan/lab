import discord
from discord.ext import commands
from gemini import chat
import os

TOKEN = os.getenv('BOT_TOKEN', None)
ALLOWED_CHANNEL_ID = int(os.getenv('ALLOWED_CHANNEL_ID', None))

intents = discord.Intents.default()
intents.message_content = True

bot = commands.Bot(command_prefix='!', intents=intents)

@bot.event
async def on_ready():
    print(f'Logged in as {bot.user.name} - {bot.user.id}')
    print('------')

@bot.command(name='ask', help='Tanya apapun ke AI, contoh: !ask Apa itu bot?')
async def ask(ctx, *, question: str):
    if ctx.channel.id == ALLOWED_CHANNEL_ID:
       await ctx.send(chat(question))

bot.run(TOKEN)
