import { createClient, SupabaseClient } from '@supabase/supabase-js';

const supabaseUrl: string = process.env.PUBLIC_SUPABASE_URL || '';
const supabaseServerKey: string = process.env.PUBLIC_SUPABASE_KEY || '';

const supabase: SupabaseClient = createClient(supabaseUrl, supabaseServerKey);

export { supabase };