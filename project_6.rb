def min(arr)
min = arr[0]
arr.each do |elem|
if elem < min
min = elem
end
end
min
end

def max(arr)
max = arr[0]
arr.each do |elem|
if elem > max
max = elem
end
end
max
end

def average(arr)
sum = 0
arr.each do |elem|
sum += elem
end
sum.to_f / arr.length
end

def rand_int(min, max)
rand(max - min + 1) + min
end



puts "Enter the number of tasks:"
num_tasks = gets.to_i

tasks = []
num_tasks.times do |i|
puts "Enter information for task #{i + 1} in the format 'c1,c2,...,cn':"
costs = gets.strip.split(',').map(&:to_i)
tasks << costs
end

iterations = 10000
results = []

iterations.times do
total_time = 0
tasks.each do |task|
cost = task[rand_int(0, task.length - 1)]
total_time += cost
end
results << total_time
end


minimum_time = min(results)
maximum_time = max(results)
average_time = average(results)
puts "After running #{iterations} simulations,"
puts "Minimum time: #{minimum_time} days"
puts "Maximum time: #{maximum_time} days"
puts "Average time: #{average_time} days\n"

bucket_size = (maximum_time - minimum_time) / 10
buckets = []
10.times do |i|
bucket_min = minimum_time + i * bucket_size
bucket_max = bucket_min + bucket_size
bucket = results.select { |result| result >= bucket_min && result <= bucket_max }
buckets << bucket
end
puts"\n"
buckets.each_with_index do |bucket, i|
bucket_min = minimum_time + i * bucket_size
bucket_max = bucket_min + bucket_size
probability = (bucket.length.to_f / iterations) * 100
puts "Probability of finishing between #{bucket_min} and #{bucket_max} days: #{probability}%"
end
puts"\n"
accumulated_probability = 0
buckets.each_with_index do |bucket, i|
  bucket_min = minimum_time + i * bucket_size
  bucket_max = bucket_min + bucket_size
  probability = (bucket.length.to_f / iterations) * 100
  accumulated_probability += probability
  puts "Probability of finishing between #{bucket_min} and #{bucket_max} days: Accumulated probability: #{accumulated_probability}%"
end
