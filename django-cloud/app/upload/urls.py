from django.urls import path
from upload.views import UploadFileView
from django.views.generic import TemplateView

app_name = 'upload'
urlpatterns = [
    path('upload/', UploadFileView.as_view(), name='upload_file'),
    path('success/', TemplateView.as_view(template_name='success.html'), name='success'),
    path('error/', TemplateView.as_view(template_name='error.html'), name='error'),
]
