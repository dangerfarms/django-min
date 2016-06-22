from django.core.management import call_command
from django.core.management.base import BaseCommand


class Command(BaseCommand):

    def handle(self, *args, **options):
        call_command('cities', '--force', **{'import': 'country,region,subregion,city'})
        call_command('load_qualifications')
        call_command('load_eligibility_regions')
        call_command('load_ethnicities')
        call_command('load_organization_data')
        call_command('load_regions')
        call_command('set_currency_rates')
        call_command('set_key_currencies')
        call_command('load_personal_options')
        call_command('loaddata', 'wc.json')
        call_command('convert_local_currency_amounts_to_usd')
