//
//  SupabaseManager.swift
//  SkillBridgeV2
//
//  Created by Andrew Tran on 2/1/25.
//

import Supabase
import Foundation

let supabase = SupabaseClient(
    supabaseURL: URL(string: "https://kweidqrgcviukknhspte.supabase.co")!,
    supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3ZWlkcXJnY3ZpdWtrbmhzcHRlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg0NDQxMjIsImV4cCI6MjA1NDAyMDEyMn0.StoDEwNEHdrsXNIqzFP-GlCvzUL4e4iY5BCJDJ7_geY"
)

