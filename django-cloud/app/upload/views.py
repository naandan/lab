# views.py
from django.views.generic.edit import FormView
from django.urls import reverse_lazy
from upload.forms import UploadFileForm
from upload.models import UploadedFile

class UploadFileView(FormView):
    template_name = 'upload.html'
    form_class = UploadFileForm
    success_url = reverse_lazy('upload:success')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['files'] = UploadedFile.objects.all()
        return context
    def form_valid(self, form):
        form.save()
        return super().form_valid(form)

    def form_invalid(self, form):
        return super().form_invalid(form)
